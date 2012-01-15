$.extend({

	getNextIndex: function(list, index) {
		
		// return (list[index++] ? index++ : 0)
		
		if(list[index + 1]) {
	        return index + 1;
	    } else {
	        return 0;
	    }
		
	},
	
	getPrevIndex: function(list, index) {
		
		if(list[index - 1]) {
	        return index - 1;
	    } else {
	        return list.length - 1;
	    }
		
	}
	
});