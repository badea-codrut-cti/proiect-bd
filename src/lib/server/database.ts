import mysql from 'mysql';
import type { Album, GenMelodie, Melodie, MembruTrupa, Trupa } from '$lib/types/database';

var connection = mysql.createConnection({
    host     : '127.0.0.1',
    user     : 'codrut',
    password : 'codrut',
    database : 'lastfm'
});

connection.connect(function(err) {
    if (err) {
        console.error("ERROR: " + err.stack);
        return;
    }
  
    console.log("Connected to database.");
});

export function escapeString(str: string) {
    return ((connection.escape(str) || "").match(/^'(\w+)'$/) || [])[1];
}

export function asyncQuery(query: string, params: any[]) {
    return new Promise<{[char: string]: any}[]>((res, rej) => {
        connection.query(query, params, (err, out) => {
            if (err)
                rej(err);

            res(out);
        })
    })
}

export async function getMembriTrupa(id: number, orderBy="cantaret") {
    if (orderBy.split(" ").length > 1)
        return [];

    let dateMembrii = await asyncQuery(
    `SELECT cantaret, MIN(data_intrare) AS data_intrare_min, \ 
    CASE WHEN EXISTS ( \
        SELECT data_plecare \
        FROM istoric_trupe \
        WHERE cantaret = it.cantaret \
        AND trupa = it.trupa \
        AND data_plecare IS NULL \
    ) THEN NULL ELSE MAX(data_plecare) \
    END AS data_plecare_min, \
    nume, prenume, url_poza \
    FROM istoric_trupe AS it \
    JOIN cantareti ct ON (ct.id = it.cantaret) \
    WHERE trupa = ? \
    GROUP BY cantaret, trupa ORDER BY ${escapeString(orderBy)};`, [id]);

    let membri: MembruTrupa[] = [];

    membri = dateMembrii.map(el => {
        return {
            cantaret: el.cantaret,
            data_intrare_min: el.data_intrare_min,
            data_plecare_min: el.data_plecare_min,
            nume: el.nume,
            prenume: el.prenume,
            url_poza: el.url_poza
        }
    });
    
    return membri;
}

export async function getGenuriCantaret(cantaretid: number) {
    let dateGenuri = await asyncQuery(
        `SELECT UNIQUE gn.eticheta, gn.id \
        FROM istoric_trupe it \
        JOIN albume ab ON (it.trupa = ab.trupa) \
        JOIN melodii me ON (me.album = ab.id) \
        JOIN genuri_melodii gm ON (gm.melodie = me.id) \
        JOIN genuri gn ON (gm.gen = gn.id) \
        WHERE it.cantaret = ? \
        AND it.data_intrare < me.data_lansare \
        AND CASE \ 
            WHEN it.data_plecare IS NULL \
                THEN 1=1 \
            ELSE it.data_plecare > me.data_lansare \
        END;`, [cantaretid]);

    return dateGenuri.map(el => {
        return {...el} as GenMelodie;
    })
}

export async function getSubgenuri(genid: number) {
    let subgenuri = await asyncQuery(
        `WITH RECURSIVE subgenuri AS (
            SELECT *
            FROM genuri
            WHERE id = ?
            UNION ALL
            SELECT ge.*
            FROM genuri ge
            INNER JOIN subgenuri su ON ge.parinte = su.id
        )
        SELECT * FROM subgenuri;`, [genid]);
    
    return {
        gen: {...subgenuri[0]} as GenMelodie,
        subgenuri: subgenuri.map(el => { return {...el} as GenMelodie }).filter((el, i) => i > 0)
    }
}

export async function authUser(username: string, passHash: string) {
    let data = await asyncQuery(`SELECT id FROM utilizatori WHERE username=? AND parola=?`, [username, passHash]);
    if (data.length < 1)
        return undefined;

    return data[0].id as number;
}