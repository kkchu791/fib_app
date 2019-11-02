import React from 'react';

const FibDisplay = ({
  log,
  messagesEnd
}) => {
  return (
    <div className="fib-window">
      <div className="fib-display">
        { log.map((l, index) => {
          return (
            <div key={index} className={index == log.length - 1 ? 'last' : ''}>{l}</div>
          )
        })}

        <div id="bottom"></div>
      </div>
    </div>
  )
}

export default FibDisplay;