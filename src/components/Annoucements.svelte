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

	<h1 class="title">Latest News:</h1>
	<div class="row">
		<div class="col s0 m1"></div>
		<div class="col s12 m10">
			<div class="splide">
				<div class="splide__track">
					<ul class="splide__list">
						<li class="splide__slide" data-splide-youtube="https://www.youtube.com/watch?v=fc5T2vDosM8">
							<div class="item">hello world</div>
						</li>
						<li class="splide__slide" data-splide-youtube="https://www.youtube.com/watch?v=fc5T2vDosM8">
							<div class="item">hello world</div>
						</li>
						<li class="splide__slide" data-splide-youtube="https://www.youtube.com/watch?v=fc5T2vDosM8">
							<div class="item">hello world</div>
						</li>
						<li class="splide__slide" data-splide-youtube="https://www.youtube.com/watch?v=fc5T2vDosM8">
							<div class="item">hello world</div>
						</li>
						<li class="splide__slide" data-splide-youtube="https://www.youtube.com/watch?v=fc5T2vDosM8">
							<div class="item">hello world</div>
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

