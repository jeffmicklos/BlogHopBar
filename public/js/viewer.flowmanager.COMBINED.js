BHB.Viewer = function(options) {
	
	var viewer = this;
	var defaults = {};
	this.settings = $.extend({}, defaults, options);
	
	this.flowManager = new BHB.FlowManager(this.settings);
	
	$('#next').click(function(event) {
		event.preventDefault();
		viewer.flowManager.next(event);
	});
	
	$('#prev').click(function(event) {
		viewer.flowManager.prev(event);
	});
	
};
BHB.FlowManager = function(options) {

	var defaults = {};
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
	} else {
		$('iframe').hide();
		this.loadSite(position, true);
	}
	
};

BHB.FlowManager.prototype.loadSite = function(position, isVisibile) {
	
	var viewer = this;
	
	$('<iframe />', {
		'id': 'site-' + position,
		'src': this.settings.links[position],
		'class': (isVisibile ? 'visible' : 'hidden')
	}).appendTo('body');
	
	$('#site-' + position).load(function(event) {
		viewer.onSiteLoaded(position);
	});
	
};

BHB.FlowManager.prototype.onSiteLoaded = function(position) {
	
	this.loadedSites.push(position);
	
};
