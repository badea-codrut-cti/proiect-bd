<script lang="ts">
    import type { Melodie } from "$lib/types/database";

    function formatSeconds(seconds: number): string {
        const hours: number = Math.floor(seconds / 3600);
        seconds %= 3600;
        const minutes: number = Math.floor(seconds / 60);
        const remainingSeconds: number = seconds % 60;
        
        if (hours > 0) {
            return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${remainingSeconds.toString().padStart(2, '0')}`;
        } else {
            return `${minutes.toString().padStart(2, '0')}:${remainingSeconds.toString().padStart(2, '0')}`;
        }
    }

    export let melodie: Melodie, url_coperta: string | undefined;
</script>

<div class="block">
    <div class="inline-block mr-3 w-16 h-16 overflow-hidden">
        <img 
        src={url_coperta ? `poze/${url_coperta}.png` : "icons/album.png"} 
        class="object-scale-down" alt="coperta-album"/>
    </div>
    <div class="name-block align-mid">
        <a href={`/melodii?id=${melodie.id}`} class="inline-block">{melodie.nume}</a>
        {#if melodie.explicit}
            <span class="bg-red-500 text-white text-xs rounded-full px-2 py-1">EXPLICIT</span>
        {/if}
    </div>
    <div class="w-32 inline-block align-mid">
        {formatSeconds(melodie.durata)}
    </div>
    <td class="w-32 inline-block align-mid">{melodie.ascultari}</td>
    <td class="w-32 inline-block align-mid">{melodie.calitate}</td>
    <td class="w-16 inline-block">
        <img src={`icons/country-flags/svg/${melodie.limba.toLocaleLowerCase()}.svg`} class="object-scale-down" alt="limba-melodie"/>
    </td>
</div>

<style>
    .name-block {
        width: 25%;
        display: inline-block;
    }

    .align-mid {
        vertical-align: top;
        margin-top: 1rem;
    }
</style>