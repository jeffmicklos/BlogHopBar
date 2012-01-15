BHB.FlowManager = function(options) {

	var defaults = {
		'preloadNextSite': true
	};
	this.settings = $.extend({}, defaults, options);

	// I am not happy about this
	this.currentPosition = 0;
	this.loadedSites = [];
	
	this.showSite(0);
	
};


BHB.FlowManager.prototype.next = function() {
	
	var next = $.getNextIndex(this.settings.links, this.currentPosition);
	
	this.showSite(next);
	this.currentPosition = next;

};

BHB.FlowManager.prototype.prev = function() {
	
	var prev = $.getPrevIndex(this.settings.links, this.currentPosition);
	
	this.showSite(prev);
	this.currentPosition = prev;
	
};


BHB.FlowManager.prototype.showSite = function(position) {

	if($.inArray(position, this.loadedSites) != -1) {
		$('iframe').hide();
		$('#site-' + position).show();
		$('body').trigger('flowmanager:shown', [position]);
	} else {
		$('iframe').hide();
		this.loadSite(position);
	}
	
};

BHB.FlowManager.prototype.loadSite = function(position, isPreloaded) {
	
	var flowmanager = this;
	
	var iframe = $('<iframe />', {
		'id': 'site-' + position,
		'src': this.settings.links[position],
		'class': (isPreloaded ? 'hidden' : 'visible')
	}).appendTo('#content');
	
	if(isPreloaded) {
		
		this.loadedSites.push(position);
		this.preloadNextSite(position, true);
		
	} else {
		
		// This event isn't firing and I can't figure out why
		$('body').trigger('flowmanager.appended', [position]);
		// so we are adding this here, even though it really shouldn't be here
		$('#overlay').show();
		iframe[0].style.filter = 'url(#displacement)';
		
		$('#site-' + position).load(function(event) {
			flowmanager.onSiteLoaded(position);
		});
		
	}
	
};

BHB.FlowManager.prototype.onSiteLoaded = function(position, isPreloaded) {

	this.loadedSites.push(position);
	this.preloadNextSite(position);

	if(!isPreloaded) {
		this.fireLoadedEvents(position);
	}
	
	
};

BHB.FlowManager.prototype.fireLoadedEvents = function(position) {
	
	$('body').trigger('flowmanager:loaded', [position]);
	$('body').trigger('flowmanager:shown', [position]);
	
}

BHB.FlowManager.prototype.preloadNextSite = function(position) {
	
	var nextPosition = $.getNextIndex(this.settings.links, position);
	
	if(this.settings.preloadNextSite && $.inArray(nextPosition, this.loadedSites) == -1) {
		this.loadSite(nextPosition, true);
	}

};