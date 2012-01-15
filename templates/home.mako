<%inherit file="main.mako" />

<%def name="css()">
    ${parent.css()}
    ${h.stylesheet_link('/css/home.css')}
</%def>

<%def name="js()">
    ${parent.js()}
</%def>

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