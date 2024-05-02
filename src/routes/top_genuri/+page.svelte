<script lang="ts">
    export let data;
</script>

{#each data.genuri as gen}
    <div>
        <a href={`/genuri?id=${gen.id}`}>
            <img src={`poze/${gen.url_emblema}.png`} class="w-16 inline-block" alt="emblema-gen"/>
            {gen.eticheta}
        </a>
    </div>
{/each}