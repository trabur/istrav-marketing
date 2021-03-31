<script>
	import { onMount } from "svelte";

	onMount(() => {
		let splide = new Splide('.splide', {
			type: 'loop',
			fixedWidth: '20em',
			autoplay: true
		})

		splide.on('autoplay:playing', function (rate) {
			console.log(rate); // 0-1
		})

		splide.mount(window.splide.Extensions)
	})
</script>


<div class="announce">
	<br class="hide-on-med-and-down" />
	<br class="hide-on-med-and-down" />
	<br />

	<h1 class="title">Getting Started:</h1>
	<div class="row">
		<div class="col s0 m1"></div>
		<div class="col s12 m10">
			<p class="description">Hello, and welcome to ISTRAV! Thank you for taking the time to consider us as your next web solutions and custom software teammate. The following series of videos is our conversion funnel for launching websites into production at rocket speeds. Please give yourself a moment to watch them, browse our bog, and checkout our community. Got questions? Jump into the FAQ, contact us by email, or take advantage of our live chat. When you succeed we succeed. So we hope you are excited just as much as we are; let's get started!</p>
			<div class="splide">
				<div class="splide__track">
					<ul class="splide__list">
						<li class="splide__slide" data-splide-youtube="https://www.youtube.com/watch?v=dsc8T-DGgnQ">
							<div class="item">adjusting the price of a tie</div>
						</li>
						<li class="splide__slide" data-splide-youtube="https://www.youtube.com/watch?v=fc5T2vDosM8">
							<div class="item">hello world</div>
						</li>
					</ul>
				</div>
			</div>
			<br />
			<br />
		</div>
		<div class="col s0 m1"></div>
	</div>

	<br class="hide-on-med-and-down" />
	<br class="hide-on-med-and-down" />
	<br />
</div>

<style>

	.title {
		color: #fff;
    text-align: center;
    font-size: 3em;
    font-weight: 100;
	}

  .description {
		margin-top: 0;
    color: #aaa;
    font-size: 1.5em;
  }

	.announce {
		background-color: #222;
		padding: 1em;
	}

	.splide__slide {
		padding: 0.5em;
	}

	:global(.splide__pagination) {
		bottom: -2em;
	}

	.splide__slide .item {
		background-color: #111;
		height: 20em;
		padding: 1em;
	}
</style>

