import { getStatistici } from '$lib/server/fetchdb.js';

export async function load(event) {
    let statistici = await getStatistici();

    return statistici;
}