declare module "@reach/dialog" {
  import React from "react"

  export type DialogProps = {
    isOpen?: boolean
    onDismiss?: () => void
    children?: React.ReactNode
    aria-label?: string
  } & React.HTMLProps<HTMLDivElement>

  type DialogOverlayProps = {
    initialFocusRef?: React.RefObject<HTMLElement>
    aria-label?: string
  } & DialogProps

  type DialogContentProps = {
    children?: React.ReactNode
  } & React.HTMLProps<HTMLDivElement>

  export const Dialog: React.SFC<DialogProps>
  export const DialogOverlay: React.SFC<DialogOverlayProps>
  export const DialogContent: React.SFC<DialogContentProps>
}
