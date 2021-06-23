import type { NextApiRequest, NextApiResponse } from 'next'
import db from '../../connection'

export default async (req: NextApiRequest, res: NextApiResponse) => {
	try {
		// NOTE: 따옴표(')가 아닌 backtick(`) 사용
		const query: string = `
			select * from Unit 
			left outer join UnitInfo on Unit.id = UnitInfo.id
			left outer join image on unit_id = unitinfo_id;
		`
		const [ rows, fields ] = await db.execute(query)

		//console.log(rows)
		res.status(200).json(rows)
	} catch (err) {
		return res.status(500).json(err)
	}
}