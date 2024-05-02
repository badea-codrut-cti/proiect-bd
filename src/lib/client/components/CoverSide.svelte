<script lang="ts">
    export let poza: string, titlu: string;
</script>

<div class="overflow-hidden w-32 h-32 inline-block">
    <img src={poza} alt="coperta"/>
</div>
<div class="inline-block align-top">
    <h1 class="text-2xl font-bold text-gray-800 inline-block">{titlu}</h1>
    <slot/>
</div>