import Axios, { AxiosInstance, AxiosResponse } from 'axios';
import { helpers } from '../tools/helpers';
import { log } from '../tools/logger';
import { axiosConfig } from './axios-config';

export default class ExplorersAPI {
  private axios: AxiosInstance;

  constructor(private url: string) {
    this.axios = Axios.create(axiosConfig);
  }

  private async post(method: string, params: string[]): Promise<AxiosResponse> {
    const infuraResponse = await this.axios.post(this.url, {
      jsonrpc: '2.0',
      id: 1,
      method,
      params,
    });
    if (!infuraResponse.data) throw new Error(`Invalid response. Response data:\n${infuraResponse.data}`);
    return infuraResponse;
  }

  async getaddressBalance(address: string) {
    return await this.post('eth_getBalance', [address, 'latest']);
  }

  async getTxByHash(txHash: string): Promise<any> {
    const response = await this.post('eth_getTransactionByHash', [txHash]);
    return response.data.result;
  }

  async waitForTx(params: { txHash: string, waitForConfirmation?: boolean, milliseconds?: number, testName?: string }): Promise<void> {
    const waitForConfirmation = params.waitForConfirmation ?? true;
    const milliseconds = params.milliseconds || 120_000;
    const startTime = Date.now();
    let tx;
    while (!tx && (Date.now() - startTime) < milliseconds) {
      tx = await this.getTxByHash(params.txHash);
      await helpers.sleep(2000);
    }
    if (!tx) throw new Error(`No tx found with hash ${params.txHash} during runnint test: "${params.testName || ''}"`);

    if (!waitForConfirmation) return;

    let isTxConfirmed = false;
    while (!isTxConfirmed && (Date.now() - startTime) < milliseconds) {
      const txReceipt = await this.getTransactionReceipt(params.txHash);
      isTxConfirmed = txReceipt.result?.status === '0x1';
      log.debug(`Tx status: ${txReceipt.result?.status}`);
      await helpers.sleep(2000);
    }
    if (!isTxConfirmed) throw new Error(`Tx with hash ${params.txHash} exists but not confirmed. Tx data:\n${helpers.stringify(tx)}\nTest with name: "${params.testName || ''}" failed!`);
  }

  async getTransactionReceipt(txHash: string): Promise<{ result: { status: string } }> {
    return (await this.post('eth_getTransactionReceipt', [txHash])).data;
  }
}

export const ropsten = new ExplorersAPI('https://ropsten.infura.io/v3/a0c2399264f646c687fffa45bf8a14c1');
export const hecochain = new ExplorersAPI('https://http-testnet.hecochain.com/');
export const bscchain = new ExplorersAPI('https://data-seed-prebsc-1-s2.binance.org:8545/');
export const evmchain = new ExplorersAPI('https://evmexplorer.testnet.velas.com/rpc');
