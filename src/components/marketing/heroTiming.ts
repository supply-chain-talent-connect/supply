// no React types needed

// Shared animation cadence
export const WORD_STEP = 0.1
export const WORD_DURATION = 0.3

// Returns when the hero heading animation finishes, based on heading and highlighted segment
export function computeHeroFinishAt(
  heading: string,
  highlighted: string,
  step: number = WORD_STEP,
  duration: number = WORD_DURATION,
): number {
  const words = heading?.trim()?.length ? heading.trim().split(' ') : []

  // No highlight: finish when last word completes
  if (!highlighted) {
    if (words.length === 0) return duration
    const lastDelay = (words.length - 1) * step
    return lastDelay + duration
  }

  const idx = heading.indexOf(highlighted)
  // Not contained: treat aurora as an extra word at the end
  if (idx === -1) {
    const auroraDelay = words.length * step
    return auroraDelay + duration
  }

  // Contained: before words -> aurora -> after words
  const before = heading.slice(0, idx).trim()
  const after = heading.slice(idx + highlighted.length).trim()
  const beforeWords = before ? before.split(' ') : []
  const afterWords = after ? after.split(' ') : []

  if (afterWords.length > 0) {
    const lastDelay = (beforeWords.length + 1 + (afterWords.length - 1)) * step
    return lastDelay + duration
  }
  // No after words: aurora is last
  const auroraDelay = beforeWords.length * step
  return auroraDelay + duration
}
