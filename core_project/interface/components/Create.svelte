<script lang="ts">
  import { daoActor, principal } from "../stores"
  let choosenproposal = "Input your proposal"
  let status;

  async function create_proposal(summarypayload) {
    status = "waiting"
    let res = await $daoActor.submit_proposal(summarypayload)
    if (res.Ok) {
      status = "success"
      return res.Ok
    } else {
      status = "error"
      throw new Error(res.Err)
    }
  }

  function handleCreateClick(payload) {
    create_proposal(payload)
  }
</script>

<div class="votemain">
  {#if $principal}
    <!-- <img src={mot} class="bg" alt="logo" /> -->
    <h1 class="slogan">Create a proposal</h1>
    <input
      bind:value={choosenproposal}
      placeholder="Input your proposal summary here"
    />
    <button on:click={() => handleCreateClick(choosenproposal)}>Create!</button>
    {#if status === "waiting"}
      <p style="color: white">...waiting</p>
    {:else if status === "success"}
      <p style="color: white">Proposal created.</p>
    {:else if status === "error"}
      <p style="color: red">An error occured.</p>
    {/if}
  {:else}
    <p class="example-disabled">Connect with a wallet to access this example</p>
  {/if}
</div>

<style>
  input {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
  }

  .bg {
    height: 55vmin;
    animation: pulse 3s infinite;
  }

  .votemain {
    display: flex;
    flex-direction: column;
    justify-content: center;
  }

  button {
    background-color: #4caf50;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
  }
</style>
