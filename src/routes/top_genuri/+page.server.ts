import { getTopGenuri } from "$lib/server/fetchdb";

export async function load({ params, url, locals }) {
	const genuri = await getTopGenuri(100000);

	return {genuri};
}