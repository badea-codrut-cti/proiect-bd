import { getSubgenuri } from '$lib/server/database.js';
import { getMelodiiTopGen } from '$lib/server/fetchdb.js';
import { validateId } from '$lib/server/helpers';
import { error } from '@sveltejs/kit';


export async function load({ params, url }) {
    const id = validateId(url.searchParams.get("id"));

	const gens = await getSubgenuri(id);

    if (!gens.gen)
        throw error(404, 'Nu exista genul respectiv.');

    const melodii = await getMelodiiTopGen(id, 100000);

	return {gens, melodii};
}