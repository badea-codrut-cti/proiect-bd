import { getAlbum, getGenuriAlbum, getMelodiiAlbum } from '$lib/server/fetchdb';
import { undefinedCast, validateId } from '$lib/server/helpers';
import { error } from '@sveltejs/kit';


export async function load({ params, url }) {
    const id = validateId(url.searchParams.get("id"));

	const album = await getAlbum(id);

    if (!album)
        throw error(404, 'Nu exista albumul respectiv.');

    const melodii = await getMelodiiAlbum(id, undefinedCast(url.searchParams.get("orderBy")));

    const genuri = await getGenuriAlbum(id);

	return {album, melodii, genuri};
}