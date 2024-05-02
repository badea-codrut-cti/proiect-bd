import { asyncQuery } from "./database";

export async function getTables() {
    let tabele = await asyncQuery(`SHOW TABLES`, []);

    let nume_tabele = tabele.map(el => {
        return el[Object.keys({...el})[0]] as string;
    });
    
    let tb_campuri = [];

    for (let i = 0; i < nume_tabele.length; i++) {
        let campuri = await asyncQuery(`SHOW COLUMNS FROM ${nume_tabele[i]}`, []);

        tb_campuri.push({
            nume: nume_tabele[i],
            campuri: campuri.map(camp => {
                return camp["Field"] as string;
            })
        });
    }

    return tb_campuri;
}