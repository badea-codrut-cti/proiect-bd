import { asyncQuery } from "./database";

export async function reorderPlaylist(playlistId: number, firstPos: number, secondPos: number) {
    let isValid = await asyncQuery(`
    SELECT COUNT(id) as cnt FROM playlisturi_melodii WHERE playlist = ? AND pozitie IN (?, ?)`, [playlistId, firstPos, secondPos]);

    if (isValid[0].cnt != 2)
        return {
            success: false,
            reason: "Nu exista melodii pe pozitiile respective."
        };

    await asyncQuery(`
    UPDATE playlisturi_melodii SET pozitie = 0 WHERE playlist = ? AND pozitie = ?; 
    `, [playlistId, firstPos]);

    await asyncQuery(`
    UPDATE playlisturi_melodii SET pozitie = ? WHERE playlist = ? AND pozitie = ?; 
    `, [firstPos, playlistId, secondPos]);

    await asyncQuery(`
    UPDATE playlisturi_melodii SET pozitie = ? WHERE playlist = ? AND pozitie = 0;
    `, [secondPos, playlistId]);

    return {
        success: true
    };
}

export async function deletePlaylistEntry(playlistId: number, songPos: number) {
    await asyncQuery(`
    DELETE FROM playlisturi_melodii WHERE playlist = ? AND pozitie = ?;
    `, [playlistId, songPos]);

    await asyncQuery(`
    UPDATE playlisturi_melodii SET pozitie = pozitie-1 WHERE playlist = ? AND pozitie > ?;
    `, [playlistId, songPos]);

    return {
        success: true
    };
}

export async function deleteById(table: string, id: number) {
    await asyncQuery(`DELETE FROM ${table} WHERE id = ?`, [id]);

    return {
        success: true
    };
}

export async function deleteGenreEntry(songId: number, genreId: number) {
    await asyncQuery(`DELETE FROM genuri_melodii WHERE melodie = ? AND gen = ?`, [songId, genreId]);

    return {
        success: true
    };
}