import React, {useState} from 'react';
import './styles/fib_page.css';
import FibDisplay from './FibDisplay'
import FibActions from './FibActions'
import { 
  getCurrentNumber,
  getNextNumber,
  getPreviousNumber,
  resetNumber,
} from '../api/fib.api.js'


const FibPage = () => {
  const [log, setLog] = useState([])

  const handleClick = async (type) => {
    if (type === "current") {
      let currNum = await getCurrentNumber();
      setLog(log.concat(`current -> ${currNum["number"]}`)) 
    } else if (type === "next") {
      let nextNum = await getNextNumber();
      setLog(log.concat(`next -> ${nextNum["number"]}`))
    } else {
      let prevNum = await getPreviousNumber();
      setLog(log.concat(`previous -> ${prevNum["number"]}`))
    }
  }

  const reset = () => {
    resetNumber();
    setLog([]);
  }

  return (
    <div className="fib-page">
      <FibActions 
        handleClick={handleClick}
        setLog={setLog}
        reset={reset}
      />

      <FibDisplay log={log} />
    </div>
  )
}

export default FibPage;