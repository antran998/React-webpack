import React from "react";
import { screen, render, cleanup, fireEvent } from "@testing-library/react";
import App from "./app";

describe("Test existence", () => {
  beforeAll(() => {
    render(<App />);
  });

  it("Should have hello text", () => {
    const message = "Hello React Man";

    expect(screen.getByText(message)).toBeInTheDocument();
  });

  afterAll(cleanup);
});
