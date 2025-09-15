import * as React from 'react'
import { cn } from '@/lib/utils'

type TabsContextValue = {
  value: string
  setValue: (v: string) => void
  orientation?: 'horizontal' | 'vertical'
}

const TabsContext = React.createContext<TabsContextValue | undefined>(undefined)

type TabsProps = React.PropsWithChildren<{
  defaultValue: string
  value?: string
  onValueChange?: (v: string) => void
  orientation?: 'horizontal' | 'vertical'
  className?: string
}>

export function Tabs({ defaultValue, value, onValueChange, orientation = 'horizontal', className, children }: TabsProps) {
  const [internal, setInternal] = React.useState(defaultValue)
  const isControlled = value !== undefined
  const val = isControlled ? (value as string) : internal
  const setValue = React.useCallback(
    (v: string) => {
      if (!isControlled) setInternal(v)
      onValueChange?.(v)
    },
    [isControlled, onValueChange],
  )
  const ctx = React.useMemo(() => ({ value: val, setValue, orientation }), [val, setValue, orientation])
  return (
    <TabsContext.Provider value={ctx}>
      <div className={cn('w-full', className)} data-orientation={orientation}>
        {children}
      </div>
    </TabsContext.Provider>
  )
}

export function TabsList({ className, children, ...rest }: React.HTMLAttributes<HTMLDivElement>) {
  const ctx = React.useContext(TabsContext)!
  return (
    <div role="tablist" aria-orientation={ctx.orientation} className={cn('inline-flex', className)} {...rest}>
      {children}
    </div>
  )
}

type TabsTriggerProps = React.ButtonHTMLAttributes<HTMLButtonElement> & { value: string }
export function TabsTrigger({ className, value, children, ...rest }: TabsTriggerProps) {
  const ctx = React.useContext(TabsContext)!
  const active = ctx.value === value
  return (
    <button
      role="tab"
      id={`tabs-trigger-${value}`}
      aria-selected={active}
      aria-controls={`tabs-content-${value}`}
      data-state={active ? 'active' : 'inactive'}
      onClick={() => ctx.setValue(value)}
      className={cn('inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-all focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50', className)}
      {...rest}
    >
      {children}
    </button>
  )
}

type TabsContentProps = React.HTMLAttributes<HTMLDivElement> & { value: string }
export function TabsContent({ className, value, children, ...rest }: TabsContentProps) {
  const ctx = React.useContext(TabsContext)!
  const active = ctx.value === value
  return (
    <div
      role="tabpanel"
      id={`tabs-content-${value}`}
      aria-labelledby={`tabs-trigger-${value}`}
      hidden={!active}
      className={cn('mt-2', className)}
      {...rest}
    >
      {active ? children : null}
    </div>
  )
}

export default Tabs
