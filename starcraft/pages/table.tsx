import axios from "axios"
import { useState, useEffect } from "react"
export default function table() {
    return (
        <div>
            <StarcraftHeader />
            <StarcraftTable />
        </div>
    )
}

const StarcraftHeader = () => {
    return <h1> Database Term Project 20181397 유찬영 </h1>
}

const StarcraftTable = () => {
	const [units, setUnits] = useState([])
	
	const fetchStarcraft = async() => {
		try{
			const res = await axios.get('https://react-term-project-moavf.run.goorm.io/api/starcraft')
			setUnits(res.data)
		} catch(err) {
			console.log(err)
		}
	}
	useEffect(() => {
		fetchStarcraft()
	}, [])
	
	return (
		<table>
			<tr>
				<th>이미지</th>
				<th>유닛이름</th>
				<th>공격력</th>
				<th>방어력</th>
				<th>건물</th>
				<th>인구수</th>
				<th>미네랄</th>
				<th>가스</th>
				<th>종류</th>
				<th>무기</th>
				<th>메모</th>
			</tr>
			{units.map((unit, index) =>
			   <tr key = {index}>
				   <td><img src={`https://react-term-project-moavf.run.goorm.io/images/${unit.filename}`} 											className='boxart'/></td>
				   <td>{unit.name}</td>
				   <td>{unit.ATK}</td>
				   <td>{unit.DEF}</td>
				   <td>{unit.buildings}</td>
				   <td>{unit.supply}</td>
				   <td>{unit.need_mineral}</td>
				   <td>{unit.need_gas}</td>
				   <td>{unit.unittype}</td>
				   <td>{unit.weapon}</td>
				   <td>{unit.description}</td>
			   </tr>
			  )}
		</table>
	)
	
}