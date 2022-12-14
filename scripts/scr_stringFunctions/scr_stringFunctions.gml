/// @desc Returns the element at the given index within a string of elements.
/// @param {string} str elements, string
/// @param {string} sep element separator, string
/// @param {any*} index element to return, [0..N-1], real
/// @returns {string}
function string_extract(str, sep, index) {
    var len;
    len = string_length(sep)-1;
    repeat (index) { 
		str = string_delete(str,1,string_pos(sep,str)+len); 
	}
    str = string_delete(str,string_pos(sep,str),string_length(str));
    return str;
}

/// @desc Splits a string based on delimiter. Returns an array.
/// @param {string} input
/// @param {string} delimiter 
/// @returns {array} 
function string_get_split(input, delimiter) {
	var slot = 0;
	var splits = []; //array to hold all splits
	var str2 = ""; //var to hold the current split we're working on building

	for (var i = 1; i < (string_length(input) + 1); i++) {
	    var currStr = string_char_at(input, i);
	    if (currStr == delimiter) {
			if (str2 != "") { // Make sure we don't include the delimiter
		        splits[slot] = str2; //add this split to the array of all splits
		        slot++;
			}
	        str2 = "";
	    } else {
	        str2 = str2 + currStr;
	        splits[slot] = str2;
	    }
	}
	// If we ended on our delimiter character, include an empty string as the final split
	if (str2 == "") {
		splits[slot] = str2;
	}

	return splits;
}



/// @desc This function returns if whether or not a certain string contains the given substring.
/// @param {string} str The String.
/// @param {string} substr The substring to look for in the string.
/// @returns {bool}
function string_contains(str, substr) {
	if string_length(substr) > string_length(str)
		return false;
	return (string_pos(substr, str) != 0);
}

/// @desc This function returns if whether or not a certain string begins with the substring.
/// @param {string} str The String.
/// @param {string} substr The substring to look for in the string.
/// @returns {bool}
function string_startswith(str, substr) {
	if string_length(substr) > string_length(str)
		return false;
	return (string_pos(substr, str) == 1);
}

/// @desc This function returns if whether or not a certain string ends with the substring.
/// @param {string} str The String.
/// @param {string} substr The substring to look for in the string.
/// @returns {bool}
function string_endswith(str, substr) {
	if string_length(substr) > string_length(str)
		return false;
	return (string_pos(substr, str) == (string_length(str) - string_length(substr)) + 1);
}
