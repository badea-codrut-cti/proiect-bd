import { getMelodiiPlaylist, getPlaylist } from '$lib/server/fetchdb';
import { validateId } from '$lib/server/helpers.js';
import { error } from '@sveltejs/kit';


export async function load({ params, url, locals }) {
    const id = validateId(url.searchParams.get("id"));

	const playlist = await getPlaylist(id);

    if (!playlist)
        throw error(404, 'Nu exista playlistul respectiv.');

    if (playlist.privat && locals.userId != playlist.creator && !locals.isAdmin)
        throw error(403, 'Playlistul respectiv este privat.');

    const melodii = await getMelodiiPlaylist(id);

	return {playlist, melodii};
}