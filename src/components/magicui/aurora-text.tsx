"use client";

import React, { memo } from "react";

interface AuroraTextProps {
  children: React.ReactNode;
  className?: string;
  colors?: string[];
  speed?: number;
}

export const AuroraText = memo(
  ({ children, className = "", colors = ["#FF0080", "#7928CA", "#0070F3", "#38bdf8"], speed: _speed = 1 }: AuroraTextProps) => {
    const gradient = `linear-gradient(135deg, ${colors.join(", ")}, ${colors[0]})`;
    return (
      <span className={`relative inline-block ${className}`}>
        <span className="sr-only">{children}</span>
        <span
          className="relative animate-aurora bg-clip-text text-transparent bg-[length:300%_100%]"
          style={{
            backgroundImage: gradient,
            WebkitBackgroundClip: "text",
            WebkitTextFillColor: "transparent",
            backgroundPosition: "0% 50%",
          }}
          aria-hidden="true"
        >
          {children}
        </span>
      </span>
    );
  },
);

AuroraText.displayName = "AuroraText";
