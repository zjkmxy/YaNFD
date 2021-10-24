/* YaNFD - Yet another NDN Forwarding Daemon
 *
 * Copyright (C) 2020-2021 Eric Newberry.
 *
 * This file is licensed under the terms of the MIT License, as found in LICENSE.md.
 */

package forms

import "github.com/gizak/termui/v3"

type Form interface {
	Render()
	RefreshSignal() <-chan uint
	KeyboardEvent(termui.Event)
}
