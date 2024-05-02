import type { Album, Cantaret, GenMelodie, Melodie, Playlist, Trupa, Utilizator } from "$lib/types/database";
import { asyncQuery, escapeString } from "./database";

export async function getCantaret(cantaretid: number) {
    let dateCantaret = await asyncQuery(`SELECT * FROM cantareti WHERE id=?`, [cantaretid]);

    if (dateCantaret.length < 1)
        return undefined;

    return {...dateCantaret[0]} as Cantaret;
}

export async function getGenuriMelodie(melodieid: number) {
    let genuriMelodie = await asyncQuery(`SELECT UNIQUE ge.* FROM genuri_melodii gm JOIN genuri ge ON (gm.gen = ge.id) WHERE melodie=?`, [melodieid]);

    return genuriMelodie.map(el => {
        return {...el} as GenMelodie;
    });
}

export async function getMelodiiAlbum(albumid: number, orderBy="data_lansare") {
    if (orderBy.split(" ").length > 1)
        return [];

    let dateMelodii = await asyncQuery(`SELECT * FROM melodii WHERE album=? ORDER BY ${escapeString(orderBy)}`, [albumid]);

    return dateMelodii.map(el => {
        return {...el} as Melodie;
    });
}

export async function getAlbum(albumid: number) {
    let dateAlbum = await asyncQuery(`SELECT * FROM albume WHERE id=?`, [albumid]);

    if (dateAlbum.length < 1)
        return undefined;

    return {...dateAlbum[0]} as Album;
}

export async function getAlbume(trupaid: number, orderBy="data_lansare") {
    if (orderBy.split(" ").length > 1)
        return [];

    let dateAlbume = await asyncQuery(`SELECT * FROM albume WHERE trupa=? ORDER BY ${escapeString(orderBy)}`, [trupaid]);

    return dateAlbume.map(el => {
        return {...el} as Album;
    });
}

export async function getTrupa(trupaid: number) {
    let dateTrupa = await asyncQuery("SELECT * FROM trupe WHERE id=?", [trupaid]);

    if (dateTrupa.length < 1)
        return undefined;

    return {...dateTrupa[0]} as Trupa;
}

export async function getGenuriAlbum(albumid: number) {
    let dateGenuri = await asyncQuery(`
    SELECT UNIQUE ge.id, ge.eticheta \
    FROM melodii me \
    JOIN genuri_melodii gm ON (gm.melodie = me.id) \
    JOIN genuri ge ON (gm.gen = ge.id) \
    WHERE me.album = ?;`, [albumid]);

    return dateGenuri.map(el => {
        return {...el} as GenMelodie;
    });
}

export async function getUtilizator(userid: number) {
    let dateUtilizator = await asyncQuery(`
    SELECT * FROM utilizatori WHERE id = ?;
    `, [userid]);

    if (dateUtilizator.length < 1)
        return undefined;

    return {...dateUtilizator[0]} as Utilizator;
}

export async function getPlaylisturiUtilizator(userid: number, orderBy="data_creat") {
    if (orderBy.split(" ").length > 1)
        return [];

    let datePlaylisturi = await asyncQuery(`SELECT * FROM playlisturi WHERE creator=? ORDER BY ${escapeString(orderBy)}`, [userid]);

    return datePlaylisturi.map(el => {
        return {...el} as Playlist;
    });
}

export async function getPlaylist(playlistid: number) {
    let datePlaylist = await asyncQuery(`SELECT * FROM playlisturi WHERE id=?;`, [playlistid]);

    if (datePlaylist.length < 1)
        return undefined;

    return {...datePlaylist[0] as Playlist};
}

export async function getMelodiiPlaylist(playlistid: number) {
    let melodiiPlaylist = await asyncQuery(`
        SELECT pozitie, melodie, me.*, url_coperta \
        FROM playlisturi_melodii pm \
        JOIN melodii me ON (pm.melodie = me.id) \
        JOIN albume al ON (me.album = al.id)\
        WHERE playlist = ?
        ORDER BY pozitie;
    `, [playlistid]);

    return melodiiPlaylist.map(el => {
        return {...el} as Melodie & {
            url_coperta: string,
            pozitie: number,
            melodie: number
        };
    });
}

export async function getMelodie(melodieId: number) {
    let melodie = await asyncQuery(`SELECT me.*, url_coperta FROM melodii me JOIN albume al ON (me.album = al.id) WHERE me.id=?;`, [melodieId]);

    if (melodie.length < 1)
        return undefined;

    return {...melodie[0]} as Melodie & {
        url_coperta: string
    };
}

export async function getTopGenuri(topLimit: number) {
    let dateGenuri = await asyncQuery(`
    SELECT ge.id, eticheta, url_emblema, SUM(ascultari * relevanta) ascultari \
    FROM genuri ge \
    JOIN genuri_melodii gm ON (ge.id = gm.gen) \
    JOIN melodii me ON \
    (gm.melodie = me.id) GROUP BY ge.id HAVING ascultari >= ? \
    ORDER BY SUM(ascultari * relevanta) DESC;`, [topLimit]);

    return dateGenuri.map(el => {
        return {...el} as GenMelodie;
    });
}

export async function getMelodiiTopGen(genId: number, topLimit: number) {
    let melodii = await asyncQuery(`
        SELECT me.*, url_coperta FROM genuri_melodii gm \
        JOIN melodii me ON (me.id = gm.melodie) \
        JOIN albume al ON (al.id = me.album) \
        WHERE gen = ? AND ascultari >= ? ORDER BY \
        (ascultari*relevanta) DESC;
    `, [genId, topLimit]);

    return melodii.map(el => {
        return {...el} as Melodie & {
            url_coperta: string
        };
    });
}

export async function getStatistici() {
    let data = await asyncQuery(`SELECT * FROM statistici`, []);
    return {...data[0]} as {
        cantareti: number,
        trupe: number,
        albume: number,
        genuri: number,
        utilizatori: number,
        playlisturi: number
    }
}

export async function getIstoricCantaret(cantaretId: number) {
    let data = await asyncQuery(`SELECT * FROM istoric_artisti WHERE cantaret = ?`, [cantaretId]);

    return data.map(el => {
        return {...el} as {
            id: number,
            cantaret: number,
            data_intrare: Date,
            data_plecare?: Date,
            trupa: number,
            nume: string,
            url_poza: string
        };
    });
}