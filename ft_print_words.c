/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_print_words.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mapena-z <mapena-z@student.42madrid.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/05/30 01:20:41 by mapena-z          #+#    #+#             */
/*   Updated: 2026/05/30 01:21:14 by mapena-z         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	print_character(char c)
{
	ft_putchar_fd(c, 1);
	return (1);
}

int	print_string(char *str)
{
	ft_putstr_fd(str, 1);
	return (ft_strlen(str));
}
