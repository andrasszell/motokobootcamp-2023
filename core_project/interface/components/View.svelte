<script lang="ts">
  import Proposal from "./Proposal.svelte"
  import { get } from "svelte/store"
  import { daoActor, principal } from "../stores"

  async function get_all_proposals() {
    let dao = get(daoActor);
    if (!dao) {
      return
    }
    let res = await dao.get_all_proposals()
    console.log("Proposals", res)
    //res = ["test1","test2"];
    return res
  }
  let promise =  get_all_proposals()
</script>

{#if $principal}
  {#await promise}
    <p>Loading...</p>
  {:then proposals}
    <table>
      <tbody>
        {#each proposals as proposal}
          <tr>
            <td>
              <p style="color: yellow">Proposal number: {proposal[0]} | </p>
            </td>
            <td>
              <p style="color: white">Proposal text: "{proposal[1].prop_text}"</p>
            </td>
          </tr>
        {/each}
      </tbody>
    </table>
  {:catch error}
    <p style="color: red">{error.message}</p>
  {/await}
{:else}
  <p class="example-disabled">Connect with a wallet to access this example</p>
{/if}

<style>
  h1 {
    color: white;
    font-size: 10vmin;
    font-weight: 700;
  }

  #proposals {
    display: flex;
    flex-direction: column;
    width: 100%;
    margin-left: 10vmin;
  }
</style>
