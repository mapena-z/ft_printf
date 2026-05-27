/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mapena-z <mapena-z@student.42madrid.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/05/27 23:22:48 by mapena-z          #+#    #+#             */
/*   Updated: 2026/05/28 00:56:34 by mapena-z         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_printf(char const *format, ...)
{
	int		i;
	int		len;
	va_list	args;

	if (!format)
		return (-1);
	va_start(args, format);
	i = 0;
	len = 0;
	while (format[i] != '\0')
	{
		len = 1;
		i++;
	}
	va_end(args);
	return (len);
}
