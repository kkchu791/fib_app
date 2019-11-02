import React from 'react';

const FibDisplay = ({
  log,
}) => {
  return (
    <div className="fib-window">
      <div className="fib-display">
        { log.map((l, index) => {
          return (
            <div key={index}>{l}</div>
          )
        })}
      </div>
    </div>
  )
}

export default FibDisplay;