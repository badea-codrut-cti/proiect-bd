import { getMembriTrupa } from '$lib/server/database';
import { getAlbume, getTrupa } from '$lib/server/fetchdb';
import { undefinedCast, validateId } from '$lib/server/helpers.js';
import { error } from '@sveltejs/kit';


export async function load({ params, url }) {
    const id = validateId(url.searchParams.get("id"));

	const trupa = await getTrupa(id);

    if (!trupa)
        throw error(404, 'Nu exista trupa respectiva.');

    let membri = await getMembriTrupa(id, undefinedCast(url.searchParams.get("artistOrderBy")));

    let albume = await getAlbume(id, undefinedCast(url.searchParams.get("albumOrderBy")));

	return {trupa, albume, membri};
}