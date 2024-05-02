import { getTables } from '$lib/server/admin.js';
import { error } from '@sveltejs/kit';


export async function load(event) {
    if (!event.locals.isAdmin)
        throw error(403, "Acces neautorizat.");

    let tabele = await getTables();
    return {tabele};
}