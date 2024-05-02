<script lang="ts">
    import CoverSide from "$lib/client/components/CoverSide.svelte";
    import SongEntry from "$lib/client/components/SongEntry.svelte";
    import Taglist from "$lib/client/components/Taglist.svelte";

    export let data;
</script>

<CoverSide poza={data.gens.gen.url_emblema ? `poze/${data.gens.gen.url_emblema}.png` : "icons/gen.png"} titlu={data.gens.gen.eticheta}>
    <p>Data Infiintare: {data.gens.gen.data_infiintat.toLocaleDateString("en-GB")}</p>
    <button on:click={() => {
        fetch(`/api/genre/del?genreId=${data.gens.gen.id}`, {
            method: "DELETE"
        });
    }}><img src="/icons/delete.svg" class="w-8" alt="delete-icon"/></button>
</CoverSide>

<br>

{#if data.gens.subgenuri.length}
    <h1 class="text-xl font-bold text-gray-800 inline-block">Subgenuri</h1>
    <br>
    <Taglist genuri={data.gens.subgenuri}/>
{/if}

<h1>Melodii relevante</h1>

{#each data.melodii as melodie}
    <SongEntry melodie={melodie} url_coperta={melodie.url_coperta}/>
{/each}