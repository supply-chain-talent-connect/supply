"use client";

import { cn } from "@/lib/utils";
import { motion, type MotionProps } from "motion/react";
import React from "react";

// Build animation props per-instance so we can control interval.
function buildAnimationProps(intervalSec: number) {
  const props = {
    initial: { "--x": "110%", scale: 1 },
    animate: { "--x": "-110%", scale: 1 },
    whileTap: { scale: 0.98 },
    transition: {
      repeat: Infinity,
      repeatType: "loop",
      repeatDelay: intervalSec,
      duration: 1.1,
      ease: "linear",
      scale: {
        type: "spring",
        stiffness: 200,
        damping: 5,
        mass: 0.5,
      },
    },
  } as AnimationProps
  return props
}

interface ShinyButtonProps
  extends Omit<React.HTMLAttributes<HTMLElement>, keyof MotionProps>,
    MotionProps {
  children: React.ReactNode;
  className?: string;
  intervalSec?: number; // how often to trigger glimmer
}

export const ShinyButton = React.forwardRef<
  HTMLButtonElement,
  ShinyButtonProps
>(({ children, className, intervalSec = 30, ...props }, ref) => {
  const animationProps = buildAnimationProps(intervalSec)
  return (
    <motion.button
      ref={ref}
      className={cn(
        "relative cursor-pointer rounded-xl px-6 py-3 font-semibold text-white shadow-sm ring-1 ring-black/5 transition-shadow duration-300 ease-in-out hover:shadow-md",
        className,
      )}
      {...animationProps}
      {...props}
    >
      <span
        className="relative block size-full text-base tracking-wide"
        style={{
          maskImage:
            "linear-gradient(-75deg,var(--primary) calc(var(--x) + 20%),transparent calc(var(--x) + 30%),var(--primary) calc(var(--x) + 100%))",
        }}
      >
        {children}
      </span>
      <span
        style={{
          mask: "linear-gradient(rgb(0,0,0), rgb(0,0,0)) content-box exclude,linear-gradient(rgb(0,0,0), rgb(0,0,0))",
          WebkitMask:
            "linear-gradient(rgb(0,0,0), rgb(0,0,0)) content-box exclude,linear-gradient(rgb(0,0,0), rgb(0,0,0))",
          backgroundImage:
            "linear-gradient(-75deg,var(--primary)/10% calc(var(--x)+20%),var(--primary)/50% calc(var(--x)+25%),var(--primary)/10% calc(var(--x)+100%))",
        }}
        className="absolute inset-0 z-10 block rounded-[inherit] p-px"
      />
    </motion.button>
  );
});

ShinyButton.displayName = "ShinyButton";
