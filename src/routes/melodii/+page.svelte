<script lang="ts">
    import CoverSide from "$lib/client/components/CoverSide.svelte";
    import Taglist from "$lib/client/components/Taglist.svelte";

    export let data;
</script>

<CoverSide poza={`poze/${data.melodie.url_coperta}.png`} titlu={data.melodie.nume}>
    <p>Data Lansare: {data.melodie.data_lansare.toLocaleDateString("en-GB")}</p>
    <h1 class="text-xl">Genuri</h1>
    <Taglist genuri={data.genuri} melodie={data.melodie.id}/>
</CoverSide>
