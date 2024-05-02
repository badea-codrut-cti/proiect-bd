import { getPlaylisturiUtilizator, getUtilizator } from '$lib/server/fetchdb.js';
import { validateId } from '$lib/server/helpers.js';
import { error } from '@sveltejs/kit';


export async function load(event) {
    const id = validateId(event.url.searchParams.get("id"));

	const utilizator = await getUtilizator(id);

    if (!utilizator)
        throw error(404, 'Nu exista utilizatorul respectiv.');

    const playlisturi = await getPlaylisturiUtilizator(id);

	return {
        utilizator: {
            id: utilizator.id,
            username: utilizator.username,
            data_inregistrare: utilizator.data_inregistrare,
            data_nasterii: utilizator.data_nasterii,
            tara_origine: utilizator.tara_origine,
            url_poza: utilizator.url_poza
        },
        playlisturi: 
            event.locals.isAdmin || event.locals.userId == id ? 
            playlisturi : playlisturi.filter(playlist => !playlist.privat)
    };
}