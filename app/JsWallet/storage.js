
module.exports = class ChromeStorage {

	STORAGE_TYPES = ['sync', 'local', 'managed'];
	storage = null;
	isSupported = false;

	constructor (type) {
		this.type = type && this.STORAGE_TYPES.includes(type) ? type : 'sync';
		this.createStorage();
		if (this.canBeUsed()) {
			this.isSupported = true;
		}
	}

	createStorage = () => {
		let $ref;
		this.storage =
			(($ref = window.chrome) !== undefined && $ref != null && $ref.storage && $ref.storage[this.type])
				? $ref.storage[this.type]
				: null;
	};

	canBeUsed = () => {
		const a = '';
		const $storage = this.storage;
		try {
			$storage.set({testkey: a}, function () {
				$storage.remove('testkey');
			})
		} catch (e) {
			return false;
		}
		return true
	}
	
	
	getItem = (item, cb) => {
		if (!this.isSupported) {
			return cb({error: 'Storage is not supported'})
		}
		this.storage.get(item, cb)
	};
	
	setItem = (item, cb) => {
		if (!this.isSupported) {
			return cb({error: 'Storage is not supported'})
		}
		if (typeof item !== 'object') {
		    return cb({error: "Type of item must be an object"});
        }
		this.storage.set(item, cb)
	}
	
}