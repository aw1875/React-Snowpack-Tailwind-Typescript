import { useState, useEffect } from "react";
import logo from "./logo.svg";
import "./App.css";

interface AppProps {}

export default function App({}: AppProps) {
  const [count, setCount] = useState<number>(0);
  const [time, setTime] = useState<number>(0);

  /**
   * Example basic function for formatting time into minutes and seconds
   *
   * @returns {string} Formatted time string
   */
  const formatTime = (): string => {
    if (time < 60) {
      return `${time} ${time !== 1 && "s"}`;
    } else {
      const minutes = Math.floor(time / 60);
      const seconds = time % 60;

      return `${
        minutes !== 1 ? `${minutes} minutes` : `${minutes} minute`
      } and ${seconds !== 1 ? `${seconds} seconds` : `${seconds} second`}`;
    }
  };

  /**
   * Example of useEffect to update a timer every second
   *
   * @returns {void} Nothing, but will run cleanup on the timer
   */
  useEffect(() => {
    const timer = setTimeout(() => {
      setTime(time + 1);
    }, 1000);

    return () => clearTimeout(timer);
  }, [time, setTime]);

  // Return the App component
  return (
    <div className="w-full h-screen bg-gray-800 flex flex-col justify-center items-center">
      <div className="w-full flex justify-center items-center">
        <img src={logo} className="w-96 animate-bounce" />
        <h1 className="text-white text-4xl font-bold">
          React Snowpack Tailwind Typescript
        </h1>
      </div>

      <p className="text-white text-center text-xl">
        Custom made React project using snowpack aloing with Tailwind. Made for
        using Typescript.
      </p>

      {/* useState Example */}
      <span className="mt-10 flex justify-center items-center gap-4">
        <p className="text-white text-center text-lg font-bold">
          Here is an example of state hooks:
        </p>

        <button
          className="bg-gray-600 px-4 py-2 text-white rounded"
          onClick={() => setCount(count + 1)}
        >
          {count === 0 ? "Click me!" : `${count} clicks!`}
        </button>
      </span>

      {/* useEffect Example */}
      <span className="my-10 flex justify-center items-center gap-4">
        <p className="text-white text-center text-lg font-bold">
          Here is an example of effect hooks:
        </p>

        <p className="text-white text-center text-lg">
          This page has been open for {formatTime()}
        </p>
      </span>
    </div>
  );
}
