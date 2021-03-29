<script>
  import { onMount } from 'svelte';

  export let appId

  let plans = []

	onMount(async () => {    
    // get the menus
    let esPlans = await scripts.subscription.plans.getAll(appId)
    if (esPlans.payload.success === true) {
      plans = esPlans.payload.data
    } else {
      console.log(esPlans.payload.reason)
    }
    console.log('plans', plans)
  })
</script>


<div class="dotted">
  <div style="min-height: 100vh;">
    <br class="hide-on-med-and-down" />
    <br class="hide-on-med-and-down" />
    <br />
    <div class="row">
      <div class="col s0 m1"></div>
      <div class="col s12 m10">
        <h1 class="title">Plans & Pricing:</h1>
        <p class="description">Many organizations big and small use ISTRAV to power their website. From fully-managed to self-service, plus pricing that scales as you grow, our solutions provide the perfect fit:</p>
        <div class="card" style="padding: 1em;">
          {#if plans.length > 0}
            <div class="row">
              {#each plans as plan}
                <div class="col s12 m4">
                  <div class="plan card" style="background-color: #eee;">
                    <h1 class="name">{plan.name}</h1>
                    {#if plan.price}
                      <div class="price">${plan.price} / mo</div>
                    {:else}
                      <div class="price">Custom</div>
                    {/if}
                    <ul class="details">
                      {#each JSON.parse(plan.details) as detail}
                        <li>{detail}</li>
                      {/each}
                    </ul>
                    <div class="jump">
                      {#if plan.price}
                        <a href={plan.purchaseUrl} class="btn-large waves-effect waves-light red lighten-2">
                          Start now
                        </a>
                      {:else}
                        <a href="/contact" class="btn-large waves-effect waves-light red lighten-2">
                          Contact Us
                        </a>
                      {/if}
                    </div>
                  </div>
                </div>
              {/each}
            </div>
          {/if}
          <hr>
          <div class="discount">
            <div class="row" style="margin: 0;">
              <div class="col s0 m1"></div>
              <div class="col s12 m6" style="">
                <h5>Non-profit or start-up company?</h5>
                <h6>Please contact us for discounted pricing.</h6>
              </div>
              <div class="col s12 m4" style="text-align: center;">
                <a href={`/contact`} class="btn-large waves-effect waves-light red lighten-2">
                  reach out
                </a>
              </div>
              <div class="col s0 m1"></div>
            </div>
          </div>
          <div class="footer">
            <br class="hide-on-med-and-down" />
            <h1>All monthly hosting packages include:</h1>
            <div class="row" style="margin: 0;">
              <div class="col s12 m4">
                <div class="includes"><i class="material-icons">exposure_plus_1</i> Unlimited items</div>
              </div>
              <div class="col s12 m4">
                <div class="includes"><i class="material-icons">https</i> Free SSL for security</div>
              </div>
              <div class="col s12 m4">
                <div class="includes"><i class="material-icons">settings_backup_restore</i> Automatic daily backups</div>
              </div>
            </div>
            <br class="hide-on-med-and-down" />
          </div>
        </div>
      </div>
      <div class="col s0 m1"></div>
    </div>
    <br class="hide-on-med-and-down" />
    <br class="hide-on-med-and-down" />
    <br />
  </div>
</div>


<style>
	.dotted {
		background-image: radial-gradient(#ddd 20%, transparent 20%), radial-gradient(#ddd 20%, transparent 20%);
    background-color: #eee;
    background-position: 0 0, 50px 50px;
    background-size: 100px 100px;
	}

	.title {
		color: #333;
    text-align: center;
    font-size: 3em;
    font-weight: 800;
	}

  .name {
    font-size: 1.5em;
    font-weight: 800;
    color: #222;
    text-align: center;
    text-transform: uppercase;
    margin: 0;
  }

  .details {
    border-top: 1px solid #ccc;
  }

  .details li {
    padding: 0.5em;
    border-bottom: 1px solid #ccc;
    color: #444;
    text-align: center;
  }

  .price {
    color: #222;
    text-align: center;
    font-size: 2em;
  }

  .plan {
    padding: 1em 0; 
  }

  .jump {
    text-align: center;
  }

  .description {
    color: #111;
    font-size: 1.5em;
  }

  .discount {
    text-align: center;
    color: #111;
    padding: 1em;
  }

  .footer {
    background-color: #26a69a;
    margin: 1em -1em -1em -1em;
    padding: 1em;
    border-radius: 0 0 0.1em 0.1em;
  }

  .footer h1 {
    text-align: center;
    color: #fff;
    font-size: 1.5em;
  }

  .footer .includes {
    text-align: center;
    color: #eee;
    line-height: 4em;
    display: flex;
  }
  .footer .includes i {
    font-size: 4em;
  }
</style>

