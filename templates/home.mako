<%inherit file="main.mako" />

<%def name="css()">
    ${parent.css()}
    ${h.stylesheet_link('/css/home.css')}
</%def>

<%def name="js()">
    ${parent.js()}
</%def>

<style>
	
	body {
		color: #555;
		background: url(/images/bg.jpg);
		font-size: 14px;
	}
	
	h1 {
		color: #555;
		font-size: 24px;
	}
	
	#bar {
		height: 20px;
	    padding: 20px;
		border-bottom: 1px solid #7C7C7C;
		box-shadow: 0 0 5px #333;
		position: relative;
		
		background-image: linear-gradient(bottom, rgb(216,216,216) 28%, rgb(245,245,245) 96%);
		background-image: -o-linear-gradient(bottom, rgb(216,216,216) 28%, rgb(245,245,245) 96%);
		background-image: -moz-linear-gradient(bottom, rgb(216,216,216) 28%, rgb(245,245,245) 96%);
		background-image: -webkit-linear-gradient(bottom, rgb(216,216,216) 28%, rgb(245,245,245) 96%);
		background-image: -ms-linear-gradient(bottom, rgb(216,216,216) 28%, rgb(245,245,245) 96%);
		
		background-image: -webkit-gradient(
			linear,
			left bottom,
			left top,
			color-stop(0.28, rgb(216,216,216)),
			color-stop(0.96, rgb(245,245,245))
		);
	}
	
	#container {
		width: 960px;
		margin: 0 auto;
		border: 1px solid #ccc;
	}
	
	.section {
		padding: 20px;
	}
	
	#top {
		background-color: #fff;
	}
	
	#middle {
		background-color: #f6f6f6;
	}
	
	#bottom {
		background-color: #95b3c0;
		border-top: 1px solid #7298A8;
		/*box-shadow: 0 3px 8px -3px #555555 inset;*/
	}
	
	h2 {
		font-weight: bold;
		font-size: 30px;
		line-height: 32px;
		margin-bottom: 10px;
		letter-spacing: -0.01em;
	}
	
	h3 {
		font-size: 24px;
		font-weight: bold;
	}
	
	h4 {
		font-size: 18px;
		font-weight: bold;
		margin-bottom: 10px;
	}
	
	#top p {
		font-size: 18px;
		line-height: 21px;
	}
	
	#bottom p {
		font-size: 13px;
		line-height: 18px;
		color: #4e5767;
		text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
	}
	
	.col-3 {
		width: 320px;
	}
	
	.col-220 {
		width: 220px;
	}
	
	.col-440 {
		width: 440px;
	}
	
	.push-20 {
		margin-right: 20px;
	}
	
	.push-40 {
		margin-right: 40px;
	}
	
	.push-160 {
		margin-right: 160px;
	}
	
	#top section {
		float: left;
	}
	
	input {
		height: 33px;
		border: 1px solid #c8c8c8;
		box-shadow: 0px 0px 0px 3px #e6e6e6;
		font-size: 16px;
		padding-left: 5px;
		margin-bottom: 16px;
		width: 100%;
	}
	
	::-webkit-input-placeholder  {
		color: #cfcfcf;
	}

	input:-moz-placeholder {
		color:#cfcfcf;
	}
	
	#add-url {
		display: block;
		font-size: 14px;
		margin: 0 0 15px;
		cursor: pointer;
	}
	
	.use-case {
		float: left;
		margin-top: 25px;
		margin-bottom: 10px;
	}
	
	.use-case img {
		float: left;
	}
	
	.use-case div {
		width: 220px;
		float: left;
	}
	
	.use-case p {
		line-height: 18px;
	}
	
	#title {
		width: 960px;
		margin: 0 auto;
		padding-left: 40px;
	}
	
	iframe {
		-moz-transform: scale(0.5, 0.5) translate(-50%, -50%);
	    height: 400px;
	    width: 640px;
	    margin-top: 10px;
	}
	
</style>

<div id="bar">
	<div id="title">
		<h1>BlogHopBar</h1>
	</div>
</div>

<div id="container">
	
	<div id="top" class="section clearfix">
		
		<section class="col-3 push-160">
			<h2>Flip through websites, with ease!</h2>
			<p>It’s like a slideshow for websites. Great for portfolios, web rings or just collecting your favorite sites!</p>
			
		</section>
		
		<section class="col-3">
			<h2>Create a Hop Now!</h2>
			<form action="${url(controller='toolkit', action='add')}" method="post">
				<input type="text" name="title" placeholder="Title (e.g. Coolest Websites Ever)">
				<input type="url" name="link" placeholder="URL (e.g. http://onwebtape.com/)">
				<strong id="add-url">+ Add Another URL</strong>
				<input type="submit" class="button" value="Start the Hop!">
			</form>
		</section>
		
	</div>
	
	<div id="middle" class="section clearfix">
		<h3>Use Cases Galore</h3>
		
		<div class="use-case col-440 clearfix push-40">
			<a href="/view/12" title="My Personal Projects">
				<img src="/images/example_portfolio.jpg" width="200" height="102" class="push-20">
			</a>
			<div>
				<h4>Makeshift Portfolio</h4>
				<p>Showing off the awesome websites you have made is tough, until now! Viewers can easily thumb through your work without losing track!</p>
			</div>
		</div>
		
		<div class="use-case col-440 clearfix">
			<a href="/view/11" title="Quality Products 101">
				<img src="/images/example_everlane.jpg" width="200" height="102" class="push-20">
			</a>
			<div>
				<h4>Bring back Web Rings</h4>
				<p>Have some complicated linking system between web sites? Throw them into a hop and let users navigate gracefully!</p>
			</div>
		</div>
		
		<div class="use-case col-440 clearfix">
			<a href="/view/14" title="Daily Reads">
				<img src="/images/example_slate.jpg" width="200" height="102" class="push-20">
			</a>
			<div>
				<h4>Organize favorite sites</h4>
				<p>Do you go to the same websites every morning? Create a hop and stop typing in the same URLs!</p>
			</div>
		</div>
		
	</div>
	
	<div id="bottom" class="section">
		<p>
			A weekend project by Jeff Micklos.<br>
			There should probably be some other text here too.
		</p>
	</div>
	
</div>


<%def name="js_foot()">
	
	$(document).ready(function() {
	
		$('#add-url').click(function(event) {
			
			var urlInput = $('input[name=link]').last();
			
			urlInput.clone(true).val('').insertAfter(urlInput);

		});
		
	});
	
</%def>