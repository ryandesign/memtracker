# SPDX-FileCopyrightText: © 2026 Ryan Carsten Schmidt <https://github.com/ryandesign>
# SPDX-License-Identifier: MIT

SHELLCHECK=shellcheck

.PHONY: check
check: memtracker
	$(SHELLCHECK) $^
