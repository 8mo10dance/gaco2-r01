import * as React from "react";
import { createRoot } from "react-dom/client";

const App = () => (
  <>
    <h1>Home#show</h1>
    <p>Find me in app/views/home/show.html.erb</p>
  </>
);

document.addEventListener("DOMContentLoaded", () => {
  const domNode = document.getElementById("root");
  if (!domNode) return;

  const root = createRoot(domNode);
  root.render(<App />);
});
