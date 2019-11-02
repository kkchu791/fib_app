import React, {useState, useEffect} from 'react';
import './styles/fib_page.css';
import FibDisplay from './FibDisplay'
import FibActions from './FibActions'
import { 
  getCurrentNumber,
  getNextNumber,
  getPreviousNumber,
} from '../api/fib.api.js'


const FibPage = () => {
  const [log, setLog] = useState([])
  const [position, setPosition] = useState(0)

  useEffect(() => {
    const scrollToBottom = () => {
      let bottomElement = document.getElementById("bottom");
      bottomElement.scrollIntoView({ behavior: "smooth" });
    }

    scrollToBottom();
  }, [log]);

  const handleClick = async (type) => {
    if (type === "current") {
      let currNum = await getCurrentNumber(position);
      setLog(log.concat(`current -> ${currNum["number"]}`))
    } else if (type === "next") {
      let nextNum = await getNextNumber(position);
      setLog(log.concat(`next -> ${nextNum["number"]}`))
      setPosition(position + 1)
    } else {
      if (position === 0) {
        setLog(log.concat(`previous -> Can't go past 0`))
      } else {
        let prevNum = await getPreviousNumber(position);
        setLog(log.concat(`previous -> ${prevNum["number"]}`))
        setPosition(position - 1)
      }
    }
  }

  const reset = () => {
    setPosition(0);
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