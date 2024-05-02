<script lang="ts">
    export let data;
</script>

<h1 class="text-3xl">Last.fm</h1>
<p>Asculți doar hituri!</p>

<h4 class="text-xl">Statistici generale</h4>
{#each Object.keys(data) as key}
    <p class="inline-block p-4">{key.charAt(0).toUpperCase() + key.slice(1).toLowerCase()}: {data[key]}</p>
{/each}