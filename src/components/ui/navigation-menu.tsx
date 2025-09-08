import * as React from 'react'
import * as NavigationMenuPrimitive from '@radix-ui/react-navigation-menu'
import { ChevronDown } from 'lucide-react'
import { cn } from '@/lib/utils'

export const NavigationMenu = ({ className, ...props }: React.ComponentPropsWithoutRef<typeof NavigationMenuPrimitive.Root>) => (
  <NavigationMenuPrimitive.Root className={cn('relative z-50', className)} {...props} />
)
export const NavigationMenuList = React.forwardRef<
  React.ElementRef<typeof NavigationMenuPrimitive.List>,
  React.ComponentPropsWithoutRef<typeof NavigationMenuPrimitive.List>
>(({ className, ...props }, ref) => (
  <NavigationMenuPrimitive.List ref={ref} className={cn('flex list-none items-center gap-1', className)} {...props} />
))
NavigationMenuList.displayName = 'NavigationMenuList'

export const NavigationMenuItem = NavigationMenuPrimitive.Item

export const NavigationMenuTrigger = React.forwardRef<
  React.ElementRef<typeof NavigationMenuPrimitive.Trigger>,
  React.ComponentPropsWithoutRef<typeof NavigationMenuPrimitive.Trigger>
>(({ className, children, ...props }, ref) => (
  <NavigationMenuPrimitive.Trigger
    ref={ref}
    className={cn(
      'inline-flex h-10 items-center justify-center gap-1 rounded-md px-4 py-2 text-sm font-medium hover:bg-muted hover:text-accent-foreground group',
      className,
    )}
    {...props}
  >
    <span>{children}</span>
    <ChevronDown className="size-4 transition-transform duration-600 ease-in-out group-data-[state=open]:rotate-180" />
  </NavigationMenuPrimitive.Trigger>
))
NavigationMenuTrigger.displayName = 'NavigationMenuTrigger'

export const NavigationMenuContent = React.forwardRef<
  React.ElementRef<typeof NavigationMenuPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof NavigationMenuPrimitive.Content>
>(({ className, ...props }, ref) => (
  <NavigationMenuPrimitive.Content
    ref={ref}
    className={cn('group rounded-md border bg-popover p-2 text-popover-foreground shadow w-[384px] max-w-[90vw]', className)}
    {...props}
  >
    <div
      className={cn(
        // Only animate incoming content to avoid size jitter
        'group-data-[motion=from-start]:animate-nm-slide-in-left group-data-[motion=from-end]:animate-nm-slide-in-right',
      )}
    >
      {props.children}
    </div>
  </NavigationMenuPrimitive.Content>
))
NavigationMenuContent.displayName = 'NavigationMenuContent'

export const NavigationMenuLink = NavigationMenuPrimitive.Link

export const NavigationMenuViewport = React.forwardRef<
  React.ElementRef<typeof NavigationMenuPrimitive.Viewport>,
  React.ComponentPropsWithoutRef<typeof NavigationMenuPrimitive.Viewport>
>(({ className, ...props }, ref) => (
  <div className="pointer-events-none absolute left-1/2 top-full -translate-x-1/2 flex justify-center">
    <NavigationMenuPrimitive.Viewport
      ref={ref}
      className={cn(
        'pointer-events-auto z-50 mt-2 origin-top overflow-hidden rounded-md border bg-popover text-popover-foreground shadow transition-none',
        'w-[384px] max-w-[90vw]',
        className,
      )}
      {...props}
    />
  </div>
))
NavigationMenuViewport.displayName = 'NavigationMenuViewport'
