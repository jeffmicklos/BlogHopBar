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
	
	$('body').bind({
		
		'flowmanager:loaded': function(event, position) {
			viewer.onSiteLoaded(position);
		},
		
		'flowmanager.appended': function(event, position) {
			viewer.onSiteAppended(position);
		},
		
		'flowmanager:shown': function(event, position) {
			viewer.updateSiteInfo(position);
		}
	
	});
	
};

BHB.Viewer.prototype.onSiteAppended = function(position) {
	
	if($.browser.mozilla) {
		document.getElementById('site-' + position).style.filter = 'url(#displacement)';	
	}
	
	$('#overlay').show();
};

BHB.Viewer.prototype.onSiteLoaded = function(position) {
	
	if($.browser.mozilla) {
		document.getElementById('site-' + position).style.filter = '';	
	}
	
	$('#overlay').hide();

};

BHB.Viewer.prototype.updateSiteInfo = function(position) {
	
	if(top != self) {
		
		$('#site-' + position).addClass('shrink');
		
	}
	
	$('#index').html(position + 1);
	$('#url').html(this.settings.links[position]);
	
};