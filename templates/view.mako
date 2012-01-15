<%inherit file="main.mako" />

<%def name="css()">
	${parent.css()}
	${h.stylesheet_link('/css/view.css')}
</%def>

<%def name="js()">
	${parent.js()}
	${h.javascript_link(
		'/js/viewer.js',
		'/js/flowmanager.js',
		minified=True,
		combined=True,
		combined_filename='package-view'
	)}
</%def>

<style>
	h1 {
		color: #555;
		font-size: 24px;
	}
	
	#sub-title {
		font-size: 11px;
		color: #999;
	}
	
	#sub-title a {
		color: inherit;	
	}

	#info {
		margin: 0 auto;
    	text-align: center;
    	width: 500px;
    	color: #555;
    	font-size: 14px;
	}
	
	.shrink {
		-moz-transform: scale(0.5, 0.5) translate(-50%, -50%);
		/*height: 500px;
		margin-left: -643px;
		margin-top: -245px;
		width: 200%;*/
		height: 500px;
		width: 1275px;
	}
	
</style>

<div id="bar">
	
	<div style="float: right;">
		<div id="nav">
			<a href="#" id="prev" class="button">Previous</a>
			<a href="#" id="next" class="button">Next</a>	
		</div>
	</div>

	
	<div style="float: left;">
		<h1>${c.title}</h1>
		<span id="sub-title">Powered by <a href="${url(controller='hop', action='index')}">BlogHopBar</a></span>
	</div>
	
	<div id="info">
		<span id="counter">
			site <span id="index">1</span> of <span id="total">${c.count}</span>
		</span><br>
		<strong id="url">
			${c.links[0]}
		</strong>
	</div>
	
</div>

<div id="overlay">
	<!-- In webkit we make the iframe have a cute animation when loading -->
	<div id="throbbers">
		<div class="circle one throbber"></div>
		<div class="circle two throbber"></div>
		<div class="circle three throbber"></div>
		<span>Loading...</span>
	</div>
</div>

<div id="content"></div>

<!-- In mozilla we make the iframe blurry when loading -->
<svg id='image' version="1.1" xmlns="http://www.w3.org/2000/svg">
   <defs>  
		<filter id="displacement" x="0%" y="0%" height="100%" width="100%">
			<feGaussianBlur stdDeviation="20" />
			<feColorMatrix
				values="0.3333 0.3333 0.3333 0 0
						0.3333 0.3333 0.3333 0 0
						0.3333 0.3333 0.3333 0 0
						0      0      0      1 0"
			/>
		</filter>
   </defs>
</svg>


<%def name="js_foot()">
	// Look into bunches: stackoverflow.com/questions/2352252/how-to-use-dicts-in-mako-templates
	new BHB.Viewer({
		'links': ${h.literal(c.js['links'])},
		'preloadNextSite': true
	});
	
</%def>