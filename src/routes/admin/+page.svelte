<script lang="ts">
    export let data;

    let tabel_activ = {
        inprop: data.tabele[0],
        
        get prop() {
            return this.inprop;
        },

        set prop(val: any) {
            date_tabel = [];
            coloanaActiva = val.campuri[0];
            this.inprop = val;
        }
    }

    let date_tabel: {[char: string]: any}[] = [];

    let activeId: number = 0;

    let coloanaActiva: string = tabel_activ.prop.campuri[0];

    let changes = {};

    function getData() {
        fetch(`/api/admin/query?table=${tabel_activ.prop.nume}&orderBy=${coloanaActiva}`, {
            method: "GET"
        }).then(async (res) => {
            date_tabel = await res.json();
        });
    }

    function updateData() {
        fetch(`/api/admin/update?table=${tabel_activ.prop.nume}&elementId=${activeId}`, {
            method: "POST",
            body: JSON.stringify(changes)
        })
    }

    
</script>

<div class="block-left-sel">
    <select bind:value={tabel_activ.prop}>
        {#each data.tabele as tabel}
            <option value={tabel}>{tabel.nume}</option>
        {/each}
    </select>
    <br>
    <select bind:value={coloanaActiva}>
        {#each tabel_activ.prop.campuri as camp}
            <option value={camp}>{camp}</option>
        {/each}
    </select>
    <br>
    <button on:click={getData}>Cauta</button>
</div>

<div class="inline-block w-1/4">
    {#each Object.keys(changes) as key}
        <label for={key} class="inline-block">{key}</label>
        <input class="inline-block px-2 py-1 border border-gray-300 placeholder-gray-500
         rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
        name={key} type="text" placeholder={key} bind:value={changes[key]}/>
        <br>
    {/each}
    <button on:click={updateData}>Update</button>
</div>


<table>
    <tbody>
        <tr>
            {#each tabel_activ.prop.campuri as camp}
                <td>{camp}</td>
            {/each}
            <td>Edit</td>
        </tr>
        {#each date_tabel as row}
            <tr>
                {#each Object.keys(row) as key}
                    <td> 
                        {String(row[key]).substring(0, 10)}
                    </td>
                {/each}
                <td>
                    <button on:click={() => {activeId = row["id"]; changes = row;}}>Edit</button>
                </td>
            </tr>
        {/each}
    </tbody>
</table>

<style>
    td {
        padding: 1rem;
        padding-top: 0;
        padding-bottom: 0;
    }

    .block-left-sel {
        width: 25%;
        display: inline-block;
    }
</style>