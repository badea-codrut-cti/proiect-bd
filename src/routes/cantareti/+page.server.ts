import { getGenuriCantaret } from '$lib/server/database.js';
import { getCantaret, getIstoricCantaret } from '$lib/server/fetchdb';
import { validateId } from '$lib/server/helpers.js';
import { error } from '@sveltejs/kit';

export async function load({ params, url }) {
    const id = validateId(url.searchParams.get("id"));

	const cantaret = await getCantaret(id);

    if (!cantaret)
        throw error(404, 'Nu exista cantaretul respectiv.');

    const genuri = await getGenuriCantaret(id);

    const istoric = await getIstoricCantaret(id);

	return {cantaret, genuri, istoric};
}