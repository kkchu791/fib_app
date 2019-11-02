import React from 'react';
import Button from 'react-bootstrap/Button'

const FibActions = ({
  handleClick,
  setLog,
  reset,
}) => {
  return (
    <div className="fib-actions">
      <Button
        className="current-btn btn"
        onClick={() => handleClick("current")}
      >
        Current
      </Button>
      <Button
        className="next-btn btn"
        onClick={() => handleClick("next")}
      >
        Next
      </Button>
      <Button
        className="previous-btn btn"
        onClick={() => handleClick("previous")}
      >
        Previous
      </Button> 
     <Button
        className="reset-btn btn"
        onClick={() => reset()}
      >
        Reset
      </Button>

      <div className="auth-section">
        Sign Up or Login
      </div>
    </div>
  )
}

export default FibActions;