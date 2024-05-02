import { getGenuriMelodie, getMelodie, getMelodiiPlaylist, getPlaylist } from '$lib/server/fetchdb';
import { validateId } from '$lib/server/helpers.js';
import { error } from '@sveltejs/kit';


export async function load({ params, url, locals }) {
    const id = validateId(url.searchParams.get("id"));

	const melodie = await getMelodie(id);

    if (!melodie)
        throw error(404, 'Nu exista melodia respectiv.');

    const genuri = await getGenuriMelodie(id);


	return {melodie, genuri};
}