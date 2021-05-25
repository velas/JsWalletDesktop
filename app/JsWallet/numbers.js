
// modified from accounting.js
function parseNum (value, decimalSep) {
    if (value == null) return NaN;
    decimalSep = decimalSep || '.';

    // Return the value as-is if it's already a number:
    if (typeof value === 'number') return value;

    // build regex to strip out everything except digits, decimal point and minus sign:
    var regex = new RegExp('[^0-9-' + decimalSep + ']', ['g']);
    var unformatted = value.toString(); // explicitly convert to string
    unformatted = unformatted
        .replace(regex, '')         // strip out any cruft
        .replace(decimalSep, '.');   // make sure decimal point is standard

    unformatted = parseFloat(unformatted);

    return unformatted;
}

module.exports.parseNum = parseNum;




/* global Intl */

// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NumberFormat
var defaultOptions = {
    nanZero: true,
    locale: 'en-US',
    localeMatcher: 'best fit',
    useGrouping: true, // grouping separator determined by locale
    maximumFractionDigits: 15
    // OTHER
    // minimumIntegerDigits
    // minimumFractionDigits
    // maximumFractionDigits
    // minimumSignificantDigits
    // maximumSignificantDigits
};

var replaceKey = function (obj, oldKey, newKey) {
	obj[newKey] = obj[oldKey];
	delete obj[oldKey];
};
var expand = function (opts, key, shorthand, full){
	if (!key.includes(full) && key.startsWith(shorthand)) {
		replaceKey(opts, key, key.replace(shorthand, full));
	}
};
var expandMin = function (opts, key){ expand(opts, key, 'min', 'minimum'); };
var expandMax = function (opts, key){ expand(opts, key, 'max', 'maximum');};


var addDigits = function(opts, key) {
	if (
			(key.startsWith('minimum') || key.startsWith('maximum')) &&
			!key.endsWith('Digits')
	) {
		replaceKey(opts, key, key + 'Digits');
	}
};

var renameKeyShortcuts = function(opts) {
	Object.keys(opts).forEach( function(key) {
		expandMin(opts, key);
		expandMax(opts, key);
	});

	Object.keys(opts).forEach( function(key){
		addDigits(opts, key);
	});

	return opts;
};

var formatNum = function(number, opts){
    opts = renameKeyShortcuts(Object.assign({}, defaultOptions, opts));
    number = parseNum(number);

    if (isNaN(number)) {
        if (opts.nanZero === false) return number;
        else number = 0;
    }

    var nf = new Intl.NumberFormat([opts.locale], Object.assign({}, opts, { style: 'decimal' }));
    return nf.format(number);
};


module.exports.formatNum = formatNum;
